Project School {
  database_type: 'MySQL'
  Note: '''
    # GI-KACE Mobile App and student system Database
    **markdown content here**
  '''
}

CREATE TABLE `students` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `other_name` varchar(255),
  `student_id` varchar(255),
  `user_id` varchar(255),
  `batch_id` int,
  `contact` varchar(255),
  `date_of_birth` date,
  `gender` varchar(255),
  `fees` varchar(255),
  `status` varchar(255),
  `deleted_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `batches` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `course_id` int,
  `course_level` varchar(255),
  `coordinator` varchar(255),
  `batch_start_date` date,
  `batch_end_date` date,
  `status` varchar(255),
  `deleted_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `courses` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` varchar(255),
  `img` varchar(255),
  `fee` int,
  `status` varchar(255),
  `deleted_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `modules` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `status` varchar(255),
  `deleted_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `course_module` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `module_id` int,
  `course_id` int,
  `module_index` int,
  `status` varchar(255),
  `deleted_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `staff_role` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `staff_id` varchar(255),
  `module_id` int,
  `batch_id` int,
  `status` varchar(255),
  `module_start_date` date,
  `module_end_date` date,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `staffs` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `staff_id` varchar(255),
  `user_id` varchar(255),
  `contact` varchar(255),
  `department` varchar(255),
  `status` varchar(255),
  `deleted_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `student_results` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `student_id` varchar(255),
  `batch_id` int,
  `module_id` int,
  `staff_id` varchar(255),
  `marks` int,
  `status` varchar(255),
  `deleted_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255),
  `email` varchar(255),
  `usertype` varchar(255),
  `password` varchar(255),
  `reset_password_token` varchar(255),
  `deleted_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `enquires` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `contact` varchar(255),
  `title` varchar(255),
  `description` varchar(255),
  `deleted_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `registration` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `course_id` int,
  `email` varchar(255),
  `contact` varchar(255),
  `session` varchar(255),
  `centre` varchar(255),
  `deleted_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `payment` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `reg_id` int,
  `payment_amt` varchar(255),
  `payment_due` varchar(255),
  `payment_balance` varchar(255),
  `payment_date` timestamp,
  `status` varchar(255),
  `deleted_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `clearance_form` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `student_id` varchar(255),
  `batch_id` int,
  `year_completed` date,
  `director_comment` varchar(255),
  `director_approval` varchar(255),
  `director_approval_date` date,
  `deleted_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `approval_of_clearance_form` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `clearance_form_id` int,
  `unit` varchar(255),
  `unit_rep` varchar(255),
  `approval` varchar(255),
  `date_of_approval` date,
  `remarks` varchar(255),
  `deleted_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp,
  
);

ALTER TABLE `payment` ADD FOREIGN KEY (`reg_id`) REFERENCES `registration` (`id`);

ALTER TABLE `batches` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

ALTER TABLE `staff_role` ADD FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`);

ALTER TABLE `staff_role` ADD FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

ALTER TABLE `staff_role` ADD FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`);

ALTER TABLE `staffs` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `student_results` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

ALTER TABLE `student_results` ADD FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`);

ALTER TABLE `student_results` ADD FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

ALTER TABLE `student_results` ADD FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`);

ALTER TABLE `students` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `students` ADD FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`);

ALTER TABLE `registration` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

ALTER TABLE `clearance_form` ADD FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`);

ALTER TABLE `clearance_form` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

ALTER TABLE `approval_of_clearance_form` ADD FOREIGN KEY (`clearance_form_id`) REFERENCES `clearance_form` (`id`);

ALTER TABLE `course_module` ADD FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

ALTER TABLE `course_module` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);
