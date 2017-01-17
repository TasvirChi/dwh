use borhan;

create index updated_at_index
on borhan.media_info(updated_at);

create index updated_at_index
on borhan.flavor_params_conversion_profile(updated_at);

create index updated_at_index
on borhan.conversion_profile_2(updated_at);

create index updated_at_index
on borhan.flavor_params_output(updated_at);