RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
      warden.authenticate! scope: :admin
    end
    config.current_user_method(&:current_admin)


config.excluded_models = ["GameCategory","Admin","MultiplayerScore","MultiplayerStat","PlaystoreUrl"]

config.model Category do
  edit do
    field :name
  end
end

config.model Game do
  edit do
    field :game_name
    field :playstore_url
    field :categories, :enum do
      enum do
        Category.all.collect{|category| [category.name,category.id]}
      end
    end
  end
end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
