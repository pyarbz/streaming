FactoryGirl.define do
  factory :detail do
    high_definition false
    blu_ray false
    onair false
    movie false
    ova false
    complete false
  end

  factory :detail_true_folder, class: Detail do
    is_dir true
    size 0
    path 'animetest'
    dropbox_modified_at Time.zone.now
    high_definition false
    blu_ray false
    onair false
    movie false
    ova false
    complete false
    season nil
    year nil
    genre nil
    category nil
    medium nil
  end

  factory :detail_true_file, class: Detail do
    is_dir false
    size 20000000
    path 'hoge.mp4'
    dropbox_modified_at Time.zone.now
    high_definition false
    blu_ray false
    onair false
    movie false
    ova false
    complete false
    season nil
    year nil
    genre nil
    category nil
    medium nil
  end

end
