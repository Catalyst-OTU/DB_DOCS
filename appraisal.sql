Project Appraisal Management System{
  database_type: 'PostgreSQL'
  Note: '''
    # Appraisal Database
    **markdown content here**
  '''
}


 TYPE "gender_type" AS ENUM (
  'male',
  'female'
);

 TABLE "annual_appraisal" (
  "comment" "character varying",
  "field" "character varying",
  "appraisal_form_id" integer NOT NULL,
  "status" integer DEFAULT 0,
  "annual_appraisal_id" bigint NOT NULL DEFAULT (nextval('public.annual_appraisal_annual_appraisal_id_seq'::regclass))
);

 TABLE "annual_plan" (
  "result_areas" "character varying",
  "target" "character varying",
  "resources" "character varying",
  "appraisal_form_id" integer,
  "annual_plan_id" bigint NOT NULL DEFAULT (nextval('public.annual_plan_annual_plan_id_seq'::regclass)),
  "start_status" integer DEFAULT 0,
  "submit" integer,
  "annual_plan_status" integer DEFAULT 0
);

 TABLE "appraisal_form" (
  "department" "character varying",
  "grade" integer,
  "positions" "character varying",
  "appraisal_form_id" bigint NOT NULL,
  "date" date DEFAULT (now()),
  "staff_id" integer NOT NULL
);

 TABLE "competency" (
  "category" "character varying",
  "sub" "character varying" NOT NULL,
  "main" "character varying",
  "weight" double,
  "competency_id" bigint
);

 TABLE "competency_details" (
  "id" bigint NOT NULL,
  "competency_id" integer NOT NULL,
  "appraisal_form_id" integer NOT NULL,
  "status" integer DEFAULT 0,
  "grade" integer,
  "submit" integer DEFAULT 1,
  "disapprove_status" integer DEFAULT 0,
  "disapprove_comments" "character varying"
);

 TABLE "deadline" (
  "deadline_type" "character varying" NOT NULL,
  "start_date" date,
  "ending" date NOT NULL,
  "deadline_id" bigint NOT NULL
);

 TABLE "department_type" (
  "id" integer NOT NULL,
  "title" "character varying"
);

 TABLE "disapprove_competency_comment" (
  "appraisal_form_id" integer,
  "competency_id" integer,
  "comments" "character varying"
);

 TABLE "endofyear_review" (
  "appraisal_form_id" integer,
  "endofyear_review_id" bigint NOT NULL,
  "performance_details_id" bigint,
  "end_status" integer DEFAULT 0,
  "average_per_rating" integer,
  "average_total" integer,
  "average_per_rating_id" bigint,
  "appraisers_comment_on_workplan" "character varying",
  "training_development_comments" "character varying",
  "submit" integer DEFAULT 1,
  "endyear_review_status" integer DEFAULT 0,
  "appraisees_comments_and_plan" "character varying",
  "head_of_divisions_comments" "character varying"
);

 TABLE "form_completion" (
  "form_completion_id" bigint NOT NULL,
  "appraisal_id" integer,
  "date" date,
  "status" integer
);

 TABLE "midyear_review" (
  "midyear_review_id" bigint NOT NULL DEFAULT (nextval('public.midyear_review_midyear_review_id_seq'::regclass)),
  "progress_review" "character varying",
  "remarks" "character varying",
  "mid_status" integer DEFAULT 0,
  "appraisal_form_id" integer,
  "competency" "character varying",
  "submit" integer DEFAULT 1,
  "midyear_review_status" integer DEFAULT 0
);

 TABLE "overall_performance" (
  "id" bigint NOT NULL,
  "description" "character varying",
  "performance" "character varying"
);

 TABLE "overall_assessment" (
  "aprpaisal_form_id" bigint,
  "performance_assessment_score" integer,
  "core_assessment_score" integer,
  "non_core_assessment_score" integer,
  "overall_total_score" integer,
  "overall_performance_rating" integer
);

 TABLE "performance_details" (
  "id" bigint NOT NULL,
  "appraisal_form_id" integer,
  "comments" "character varying",
  "status" integer DEFAULT 0,
  "approved_date" date,
  "submit" integer DEFAULT 0,
  "weight" "character varying",
  "final_score" "character varying",
  "performance_details_id" integer,
  "p_a" "character varying"
);

 TABLE "reset_password_codes" (
  "id" integer NOT NULL,
  "code" "character varying",
  "user_id" integer,
  "user_email" "character varying",
  "status" boolean NOT NULL,
  "date_d" timestamp,
  "date_modified" timestamp
);

 TABLE "reset_password_token" (
  "id" integer NOT NULL,
  "user_id" integer,
  "token" "character varying",
  "date_d" timestamp
);

 TABLE "revoked_tokens" (
  "id" integer NOT NULL,
  "jti" "character varying",
  "date_d" timestamp,
  "date_modified" timestamp
);

 TABLE "roles" (
  "role_id" integer NOT NULL,
  "role_description" "character varying" NOT NULL
);

 TABLE "save_annual_plan" (
  "result_areas" "character varying",
  "target" "character varying",
  "resources" "character varying",
  "appraisal_form_id" integer
);

 TABLE "staff" (
  "staff_id" bigint NOT NULL,
  "fname" "character varying" NOT NULL,
  "sname" "character varying" NOT NULL,
  "oname" "character varying",
  "email" "character varying" NOT NULL,
  "supervisor" integer,
  "gender" "character varying" NOT NULL,
  "department" "character varying",
  "positions" "character varying",
  "grade" integer,
  "appointment" date,
  "roles" integer,
  "staff_status" integer DEFAULT 1
);

 TABLE "supervisor_comment" (
  "annual_plan_comment" "character varying",
  "midyear_review_comment" "character varying",
  "endofyear_review" "character varying",
  "appraisal_form_id" integer
);

 TABLE "table1" (
  "id" integer NOT NULL,
  "name" "character varying"
);

 TABLE "table2" (
  "id" integer NOT NULL,
  "name" "character varying"
);

 TABLE "training_received" (
  "institution" "character varying",
  "date" "character varying",
  "programme" "character varying",
  "appraisal_form_id" integer,
  "submit" integer
);

 TABLE "user_type" (
  "id" integer NOT NULL,
  "title" "character varying"
);

 TABLE "users" (
  "id" integer NOT NULL,
  "staff_id" integer,
  "email" "character varying",
  "password" "character varying",
  "status" boolean DEFAULT true,
  "user_type_id" integer,
  "department_type_id" integer
);

 TABLE "yearly_details" (
  "department" "character varying" NOT NULL,
  "grade" integer NOT NULL,
  "position" "character varying" NOT NULL,
  "year" date NOT NULL DEFAULT (now()),
  "staff_id" integer NOT NULL,
  "yearly_details_id" bigint NOT NULL
);

INDEX "ix_department_type_id" ON "department_type" USING BTREE ("id");

 UNIQUE INDEX "ix_department_type_title" ON "department_type" USING BTREE ("title");

 INDEX "ix_reset_password_codes_id" ON "reset_password_codes" USING BTREE ("id");

 INDEX "ix_reset_password_token_id" ON "reset_password_token" USING BTREE ("id");

 INDEX "ix_reset_password_token_token" ON "reset_password_token" USING BTREE ("token");

 INDEX "ix_user_type_id" ON "user_type" USING BTREE ("id");

 UNIQUE INDEX "ix_user_type_title" ON "user_type" USING BTREE ("title");

 UNIQUE INDEX "ix_users_email" ON "users" USING BTREE ("email");

 INDEX "ix_users_id" ON "users" USING BTREE ("id");

ALTER TABLE "annual_plan" ADD CONSTRAINT "ann fk" FOREIGN KEY ("appraisal_form_id") REFERENCES "appraisal_form" ("appraisal_form_id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "annual_appraisal" ADD CONSTRAINT "ann_app_fk" FOREIGN KEY ("appraisal_form_id") REFERENCES "appraisal_form" ("appraisal_form_id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "appraisal_form" ADD CONSTRAINT "app1_fk" FOREIGN KEY ("staff_id") REFERENCES "staff" ("staff_id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "overall_assessment" ADD CONSTRAINT "app_f_id_fkey" FOREIGN KEY ("aprpaisal_form_id") REFERENCES "appraisal_form" ("appraisal_form_id");

ALTER TABLE "disapprove_competency_comment" ADD CONSTRAINT "app_fid_ff" FOREIGN KEY ("appraisal_form_id") REFERENCES "appraisal_form" ("appraisal_form_id");

ALTER TABLE "supervisor_comment" ADD CONSTRAINT "app_s" FOREIGN KEY ("appraisal_form_id") REFERENCES "appraisal_form" ("appraisal_form_id");

ALTER TABLE "competency_details" ADD CONSTRAINT "appraisal_form_id_fkey3" FOREIGN KEY ("appraisal_form_id") REFERENCES "appraisal_form" ("appraisal_form_id");

ALTER TABLE "training_received" ADD CONSTRAINT "appraisal_form_id_for_key" FOREIGN KEY ("appraisal_form_id") REFERENCES "appraisal_form" ("appraisal_form_id");

ALTER TABLE "competency_details" ADD CONSTRAINT "comp" FOREIGN KEY ("competency_id") REFERENCES "competency" ("competency_id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "endofyear_review" ADD CONSTRAINT "endfk" FOREIGN KEY ("performance_details_id") REFERENCES "performance_details" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "performance_details" ADD CONSTRAINT "performance_fk" FOREIGN KEY ("performance_details_id") REFERENCES "overall_performance" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "staff" ADD CONSTRAINT "role_fk" FOREIGN KEY ("roles") REFERENCES "roles" ("role_id");

ALTER TABLE "staff" ADD CONSTRAINT "sup_fk" FOREIGN KEY ("supervisor") REFERENCES "staff" ("staff_id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "users" ADD CONSTRAINT "users_department_type_id_fkey" FOREIGN KEY ("department_type_id") REFERENCES "department_type" ("id");

ALTER TABLE "users" ADD CONSTRAINT "users_email_fkey" FOREIGN KEY ("email") REFERENCES "staff" ("email");

ALTER TABLE "users" ADD CONSTRAINT "users_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "staff" ("staff_id");

ALTER TABLE "yearly_details" ADD CONSTRAINT "year_fk" FOREIGN KEY ("staff_id") REFERENCES "staff" ("staff_id") ON DELETE CASCADE ON UPDATE CASCADE;
