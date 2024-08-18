DROP TABLE IF EXISTS requests, event_compilation,comments, events, compilations, locations, categories, users;

CREATE TABLE IF NOT EXISTS users (
                                     id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL UNIQUE,
                                     email VARCHAR NOT NULL UNIQUE,
                                     name VARCHAR NOT NULL,
                                     CONSTRAINT pk_users PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS categories (
                                          id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL UNIQUE,
                                          name VARCHAR UNIQUE,
                                          CONSTRAINT pk_categories PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS locations (
                                         id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL UNIQUE,
                                         lat FLOAT,
                                         lon FLOAT,
                                         CONSTRAINT pk_locations PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS compilations (
                                            id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL UNIQUE,
                                            pinned BOOLEAN,
                                            title VARCHAR NOT NULL,
                                            CONSTRAINT pk_compilations PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS events (
                                      id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL UNIQUE,
                                      annotation VARCHAR NOT NULL,
                                      category_id BIGINT,
                                      confirmed_requests INTEGER,
                                      created_on TIMESTAMP,
                                      description VARCHAR,
                                      event_date TIMESTAMP NOT NULL,
                                      initiator_id BIGINT,
                                      location_id BIGINT NOT NULL,
                                      paid BOOLEAN NOT NULL,
                                      participant_limit INTEGER,
                                      published_on TIMESTAMP,
                                      request_moderation BOOLEAN,
                                      state VARCHAR,
                                      title VARCHAR NOT NULL,
                                      views INTEGER,
                                      CONSTRAINT fk_events_to_users FOREIGN KEY (initiator_id) REFERENCES users (id),
                                      CONSTRAINT fk_events_to_categories FOREIGN KEY (category_id) REFERENCES categories (id),
                                      CONSTRAINT fk_events_to_locations FOREIGN KEY (location_id) REFERENCES locations (id),
                                      CONSTRAINT pk_events PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS event_compilation (
                                                 event_id BIGINT,
                                                 compilation_id BIGINT,
                                                 CONSTRAINT fk_event_compilation_to_compilations FOREIGN KEY (compilation_id) REFERENCES compilations (id),
                                                 CONSTRAINT fk_event_compilation_to_events FOREIGN KEY (event_id) REFERENCES events (id),
                                                 CONSTRAINT pk_event_compilation PRIMARY KEY (event_id, compilation_id)
);

CREATE TABLE IF NOT EXISTS requests (
                                        id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL UNIQUE,
                                        created TIMESTAMP NOT NULL,
                                        event_id BIGINT,
                                        requester_id BIGINT,
                                        status VARCHAR,
                                        CONSTRAINT pk_requests PRIMARY KEY (id),
                                        CONSTRAINT fk_requests_to_users FOREIGN KEY (requester_id) REFERENCES users (id),
                                        CONSTRAINT fk_requests_to_events FOREIGN KEY (event_id) REFERENCES events (id)
);
CREATE TABLE IF NOT EXISTS comments (
                                        id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL UNIQUE,
                                        commentator_id BIGINT,
                                        event_id BIGINT,
                                        created TIMESTAMP ,
                                        text VARCHAR,
                                        CONSTRAINT pk_comments PRIMARY KEY (id),
                                        CONSTRAINT fk_comments_to_users FOREIGN KEY (commentator_id) REFERENCES users (id),
                                        CONSTRAINT fk_comments_to_events FOREIGN KEY (event_id) REFERENCES events (id)
);
