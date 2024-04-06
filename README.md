# Local development setup

In the root directory of the project run the following to install dependencies
and then start the local development server:

## Install dependencies
```
npx yarn install
```

## Create database schema locally

We are using [Drizzle ORM](https://orm.drizzle.team/docs/overview) to manage 
our database schema and generate migrations as well as keep our database queries 
clean and reusable.

Drizzle ORM generates schema files based on a diff between the schema file in `db/schema.ts` and the actual database schema. Generated migration files will be named
`000X_random_string.sql` and will be placed in the `drizzle` folder.

You will need to create the database locally by running each migration file 
in numerical order with the following command:
```
npx wrangler d1 execute gaza-care-staging --local --file=drizzle/SQL_FILE.sql -e staging
```

For example, with the current schema files:

```
npx wrangler d1 execute gaza-care-staging  --file=drizzle/0000_cultured_namorita.sql -e staging
npx wrangler d1 execute gaza-care-staging  --file=drizzle/0001_shocking_komodo.sql -e staging
npx wrangler d1 execute gaza-care-staging  --file=drizzle/0002_balcker_spacker_dave.sql -e staging
npx wrangler d1 execute gaza-care-staging  --file=drizzle/0003_old_boomer.sql -e staging
```

## Start the development server
```
npx yarn run dev
```

The server is now running and ready to accept requests on the given
port number.

## Contributing Guidelines

- Cut a branch from master of the form `ab/short-describe-changes`
  Where `ab` is your initials or some form of your github identifier.

- Make your changes

- Push your branch and create a pull request

<<<<<<< HEAD
- Once approved, try to merge your PR as soon as possible

### Commit Messages

We follow [Tim Pope's convention for commit messages](https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html):

```
Capitalized, short (50 chars or less) summary

More detailed explanatory text, if necessary.  Wrap it to about 72
characters or so.  In some contexts, the first line is treated as the
subject of an email and the rest of the text as the body.  The blank
line separating the summary from the body is critical (unless you omit
the body entirely); tools like rebase can get confused if you run the
two together.

Write your commit message in the imperative: "Fix bug" and not "Fixed bug"
or "Fixes bug."  This convention matches up with commit messages generated
by commands like git merge and git revert.

Further paragraphs come after blank lines.

- Bullet points are okay, too

- Typically a hyphen or asterisk is used for the bullet, followed by a
  single space, with blank lines in between, but conventions vary here

- Use a hanging indent

Final line should include Issue number and what the commit does for the
issue.

Closes Issue:

[Closes #ISSUE-NUMBER]

Related to Issue:

[#ISSUE-NUMBER]
```

#### Example

```
Add new endpoint to delete a video

- Add new `delete` function in `models/index.js`

[#4]
```

### Project structure

The project structure is quite basic. 

- Any database queries/logic should go into the `models/index.js` file.

- Any server code for new endpoints should go into `src/index.ts` file

### Making Database Schema Changes

If you need to create a new table or add a new column, you can do
so by:

- Updating the `db/schema.ts` file

- Running the `npx yarn db:schema:generate` command

A new migration `.sql` file will be created in the `drizzle` folder,
which you can then run with the following command:

```
npx wrangler d1 execute gaza-care-staging --local --file=drizzle/SQL_FILE.sql -e staging
```

### Running queries against your local database

You can run any sql queries to inspect the status of your local database

```
npx wrangler d1 execute gaza-care-staging --local --command 'SQL COMMAND' -e staging
```

Example:

```
npx wrangler d1 execute gaza-care-staging --local --command 'select * from users' -e staging
```

Note: you need to be in the root of the project for these commands
to work.


### Resetting your local database

If you need to blow away your database and rebuild it, you can 
delete the `.wrangler/state/v3/d1` directory. You will need to
re-run all migration files.


# Deploying to production
```
npx yarn deploy
```

