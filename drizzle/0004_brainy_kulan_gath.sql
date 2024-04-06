DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
	`translatable_id` integer NOT NULL,
	`translatable_type` text NOT NULL,
	`translatable_field` text NOT NULL,
	`language` text NOT NULL,
	`text` text NOT NULL,
	`created_at` integer DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at` integer DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY(`language`, `translatable_field`, `translatable_id`, `translatable_type`)
);
--> statement-breakpoint
CREATE INDEX `text_idx` ON `translations` (`text`);
