use borhan;

create index updated_at_index
on borhan.file_sync(updated_at);

create index updated_at_index
on borhan.flavor_asset(updated_at);

create index updated_at_index
on borhan.flavor_params(updated_at);