-- +goose Up
-- +goose StatementBegin
CREATE SCHEMA IF NOT EXISTS task;
create table task.items (
    id serial primary key,
    uid uuid unique default utils.new_uuid(),
    title varchar(100) not null,
    content text,
    created_at timestamp not null default now(),
    updated_at timestamp
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
drop table if exists task.items;
drop schema if exists task;
-- +goose StatementEnd
