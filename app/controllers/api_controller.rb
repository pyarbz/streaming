require 'benchmark'

class ApiController < ApplicationController
  # before_filter :authenticate_user! #ログインしている時しかアクセスできないようにする

  # /api
  def index

    # this_params = {
    #   path: '/anime/アニメ',
    #   id: 2
    # }
    # next_id time = 0.048072 s
    # this_id time = 0.001851 s

    # this_params = {
    #   path: '/anime/アニメ/2012_4秋アニメ/ToLoveる Darkness/#03.mp4',
    #   id: 7
    # }
    # next_id time = 0.009147 s
    # this_id time = 0.0126 s

    # ファイル名が同じものが多いと、next_idが速い
    # ファイル名が同じものが少ないと、this_idが速い

    # this_params = {
    #   path: '/anime/アニメ/2013_2春アニメ/RDG レッドデータガール',
    #   list: true,
    #   file_limit: 10000,
    #   include_deleted: false,
    #   depth: 1
    # }

    # data = DropboxHelper.get_fileList(this_params)


    # @result_next = Benchmark.realtime do
    #   @detail_lists = PathObject.path_and_id_lists(data)
    # end
    # @result_this = Benchmark.realtime do
    #   @dropbox_lists = PathObject.dropbox_path_lists(data)
    # end
    # @result_destroy = Benchmark.realtime do
    #   @destroy_id = DestroyObject.destroy_detail(@dropbox_lists,@detail_lists)
    # end

    # print "\e[31m"
    # puts "next_id time = #{@result_next} s"
    # print "\e[32m"
    # puts "this_id time = #{@result_this} s"
    # print "\e[0m"

  end

  # /api/root
  def get_root_info
    @root_info = GetObject.get_root.to_json
    render json: @root_info
  end

  # /api/detail
  def get_object_info
    @object_info = GetObject.get_object(params).to_json
    render json: @object_info
  end

end
