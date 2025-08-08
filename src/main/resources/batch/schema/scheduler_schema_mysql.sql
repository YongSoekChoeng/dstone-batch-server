
CREATE TABLE BATCH_SCHEDULER_CONFIGURATION
(
    id                   BIGINT AUTO_INCREMENT NOT NULL,
    application_name     VARCHAR(255) NOT NULL,
    job_name             VARCHAR(255) NOT NULL,
    configuration_status VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE BATCH_SCHEDULER_CONFIGURATION_VALUE
(
    id                         BIGINT AUTO_INCREMENT NOT NULL,
    scheduler_configuration_id BIGINT       NOT NULL,
    type                       VARCHAR(255) NOT NULL,
    value                      VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (scheduler_configuration_id) REFERENCES BATCH_SCHEDULER_CONFIGURATION (id)
);

CREATE TABLE BATCH_SCHEDULER_EXECUTION
(
    id                         BIGINT AUTO_INCREMENT NOT NULL,
    scheduler_configuration_id BIGINT    NOT NULL,
    next_fire_time             TIMESTAMP NOT NULL,
    execution_count            INT       NOT NULL DEFAULT 0,
    state                      INT       NOT NULL,
    last_update                TIMESTAMP NOT NULL DEFAULT NOW(),
    next_retry                 TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (id),
    FOREIGN KEY (scheduler_configuration_id) REFERENCES BATCH_SCHEDULER_CONFIGURATION (id)
);

-- INDEX
-- BATCH_SCHEDULER_CONFIGURATION
CREATE INDEX idx_sc_app_name ON BATCH_SCHEDULER_CONFIGURATION (application_name);
-- BATCH_SCHEDULER_EXECUTION
CREATE INDEX idx_se_next_fire_time ON BATCH_SCHEDULER_EXECUTION (next_fire_time);
CREATE INDEX idx_se_state ON BATCH_SCHEDULER_EXECUTION (state);
CREATE INDEX idx_se_state_next_fire_time ON BATCH_SCHEDULER_EXECUTION (state, next_fire_time);
CREATE INDEX idx_se_sc_id ON BATCH_SCHEDULER_EXECUTION (scheduler_configuration_id);
CREATE INDEX idx_se_sc_id_state ON BATCH_SCHEDULER_EXECUTION (scheduler_configuration_id, state);
