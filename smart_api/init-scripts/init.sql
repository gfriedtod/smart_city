create domain email as varchar(255)
    constraint email_check check ((VALUE)::text ~
    '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$'::text);

comment on type email is 'Email address with basic format validation';

create domain user_status as varchar(20)
    constraint user_status_check check ((VALUE)::text = ANY
    ((ARRAY ['USER'::character varying, 'ADMIN'::character varying, 'SUPERADMIN'::character varying])::text[]));

comment on type user_status is 'Allowed user status values for consistent state management';

create domain profile as varchar(20)
    constraint profile_check check ((VALUE)::text = ANY
    ((ARRAY ['USER'::character varying, 'ADMIN'::character varying, 'SUPERADMIN'::character varying])::text[]));

comment on type profile is 'Allowed user status values for consistent state management';

create domain status as varchar(10)
    constraint status_check check ((VALUE)::text = ANY
    (ARRAY [('SUBMIT'::character varying)::text, ('IN_PROGRESS'::character varying)::text, ('RESOLVED'::character varying)::text]));

create table if not exists category
(
    id         uuid        not null
    primary key,
    name       varchar(50) not null
    unique,
    created_at timestamp with time zone default CURRENT_TIMESTAMP,
    updated_at timestamp with time zone default CURRENT_TIMESTAMP,
                             is_active  boolean                  default true
                             );

comment on table category is 'Stores categories for classifying incidents';

comment on column category.id is 'Unique identifier for the category';

comment on column category.name is 'Name of the category';

comment on column category.created_at is 'Timestamp when the category was created';

comment on column category.updated_at is 'Timestamp when the category was last updated';

comment on column category.is_active is 'Flag indicating if the category is active';

create table if not exists "user"
(
    id         uuid                                                       not null
    primary key,
    username   varchar(50)                                                not null
    unique,
    email      email                                                      not null
    unique,
    password   varchar(255)                                               not null,
    profile    profile                  default 'USER'::character varying not null,
    created_at timestamp with time zone default CURRENT_TIMESTAMP,
    updated_at timestamp with time zone default CURRENT_TIMESTAMP,
                             is_active  boolean                  default true
                             );

create table if not exists incident
(
    id          uuid                                                         not null
    primary key,
    name        varchar(15)                                                  not null,
    description varchar(255)                                                 not null,
    image       text,
    longitude   double precision,
    latitude    double precision,
    status      status                   default 'submit'::character varying not null,
    created_at  timestamp with time zone default CURRENT_TIMESTAMP,
    updated_at  timestamp with time zone default CURRENT_TIMESTAMP,
                              user_id     uuid
                              references "user",
                              category_id uuid
                              references category
                              );

comment on table incident is 'Stores incident information reported by users';

comment on column incident.id is 'Unique identifier for the incident';

comment on column incident.name is 'Short name/title of the incident';

comment on column incident.description is 'Detailed description of the incident';

comment on column incident.image is 'URL or path to the incident image';

comment on column incident.longitude is 'Geographic longitude of the incident location';

comment on column incident.latitude is 'Geographic latitude of the incident location';

comment on column incident.status is 'Current status of the incident';

comment on column incident.created_at is 'Timestamp when the incident was created';

comment on column incident.updated_at is 'Timestamp when the incident was last updated';

comment on column incident.user_id is 'Reference to the user who reported the incident';

comment on column incident.category_id is 'Reference to the category of the incident';

