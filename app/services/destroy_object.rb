class DestroyObject

  def self.destroy_detail(dropbox_lists, detail_lists)
    delete_list_id = []

    # Dropbox APIがpathを持っていなかったらtrue
    return true if dropbox_lists[:pathlist].blank?

    # 閉包テーブルがpathを持っていなかったらtrue
    return true if detail_lists[:pathlist].blank?

    # dropboxに無くて、閉包テーブルに存在するDetailIDをリスト化する。
    detail_lists[:path_id_maps].each do |detail_list|
      unless dropbox_lists[:pathlist].include?(detail_list[:path])
        delete_list_id.push(detail_list[:id])
      end
    end

    # 削除するリストが空だったら削除しない
    return true if delete_list_id.blank?

    # return delete_list_id
    # リスト化したものを削除
    delete_list_id.each do |id|
      this_is_dir = Detail.find(id).is_dir

      if this_is_dir # ディレクトリの場合

        delete_descendant_id = DetailClosure.where('ancestor_detail_id = ?', id).pluck(:descendant_detail_id)
        # return delete_descendant_id
        closures = DetailClosure.where("descendant_detail_id in (?)", delete_descendant_id)
        closures.each do |closure|
          closure.destroy
        end
        # closureを削除したらDetailからも削除
        Detail.destroy(delete_descendant_id)

      else #ファイルの場合
        closures = DetailClosure.where('descendant_detail_id = ?', id)
        closures.each do |closure|
          closure.destroy
        end
        # closureを削除したらDetailからも削除
        Detail.destroy(id)
      end
    end

    return true
  end
end
