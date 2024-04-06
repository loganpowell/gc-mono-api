CREATE TABLE `translations` (
	`translatable_id` integer NOT NULL,
	`translatable_type` text NOT NULL,
	`translatableField` text NOT NULL,
	`language` text NOT NULL,
	`text` text NOT NULL,
	`created_at` integer DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at` integer DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY(`language`, `translatableField`, `translatable_id`, `translatable_type`)
);
--> statement-breakpoint
ALTER TABLE videos ADD `language` text;--> statement-breakpoint
ALTER TABLE views ADD `viewable_type` text NOT NULL;--> statement-breakpoint
CREATE INDEX `text_idx` ON `translations` (`text`);--> statement-breakpoint
CREATE INDEX `contentTextIdx` ON `videos` (`content_text`);--> statement-breakpoint
ALTER TABLE `videos` DROP COLUMN `title`;--> statement-breakpoint
ALTER TABLE `videos` DROP COLUMN `description`;--> statement-breakpoint
ALTER TABLE `videos` DROP COLUMN `keywords`;