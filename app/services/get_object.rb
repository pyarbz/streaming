class GetObject

  # rootの情報を取得してjsonを作成するメソッド
  def self.get_root
    root = Detail.where('details.is_root = true')
    root_info = GenerateHash.generate_detail_info(root)
    return root_info
  end

  # IDの情報を取得してjsonを作成するメソッド
  # SQLインジェクション対策済み
  def self.get_object(params)

    # デフォルトはfalse
    object_info = {request: false}

    # idを与えられなかったらfalse
    return object_info if params[:id].blank?

    # idが整数値か判断
    id_is_true = ApiHelper.integer_string?(params[:id])

    # 整数値だった場合のみ、DBから探す
    # 整数値じゃなかった場合はfalse
    if id_is_true
      object = Detail.where('details.id = ?', "#{params[:id]}")
    else
      return object_info
    end

    # テーブルに見つからなかったらfalse
    return object_info if object.blank?

    # テーブルに見つかったら情報を取得
    object_info = GenerateHash.generate_detail_info(object)
    return object_info
  end

  # IDの情報を取得してjson pathを作成するメソッド
  # SQLインジェクション対策済み
  def self.get_object_path(params)

    # デフォルトはfalse
    object_info = {request: false}

    # idを与えられなかったらfalse
    return object_info if params[:id].blank?

    # idが整数値か判断
    id_is_true = ApiHelper.integer_string?(params[:id])

    # 整数値だった場合のみ、DBから探す
    # 整数値じゃなかった場合はfalse
    if id_is_true
      object = Detail.where('details.id = ?', "#{params[:id]}")
    else
      return object_info
    end

    # テーブルに見つからなかったらfalse
    return object_info if object.blank?

    # テーブルに見つかったら情報を取得
    object_info = GenerateHash.generate_detail_path_info(object)
    object_info[:request] = true
    return object_info
  end

  # 親を取得するメソッド
  # current: whereで与えた値(classはDetail::ActiveRecord_Relation)
  # depth: どの分上の親まで取得するか
  def self.get_parents(current, depth)
    return nil unless current.class == Detail::ActiveRecord_Relation

    current.joins(:descendant_relations => :ancestor_relationship)
      .where(['detail_closures.depth >= ? and detail_closures.depth <= ?', 1, depth])
      .select('ancestor_relationships_detail_closures.*')
  end

  # 子を取得するメソッド
  # current: whereで与えた値(classはDetail::ActiveRecord_Relation)
  # depth: どの分下の子まで取得するか
  def self.get_childs(current, depth)
    return nil unless current.class == Detail::ActiveRecord_Relation

    current.joins(:ancestor_relations => :descendant_relationship)
      .where(['detail_closures.depth >= ? and detail_closures.depth <= ?', 1, depth])
      .select('descendant_relationships_detail_closures.*')
  end

end
