#!/usr/bin/env bash
# Run AFTER: drush site:install --existing-config (or on an already-configured site)
# Roles lms_admin / lms_teacher come from config/default — confirmed present.

set -e

# 1. Give user 1 the LMS Admin role (required — LMS screens misbehave without it)
ADMIN_NAME=$(ddev drush user:information --uid=1 --field=name)
ddev drush user:role:add lms_admin "$ADMIN_NAME"

# 2. Demo accounts you'll log in as during the presentation
ddev drush user:create "LMS Admin" --mail="lms.admin@example.com" --password="123456"
ddev drush user:role:add lms_admin "LMS Admin"

ddev drush user:create "LMS Teacher" --mail="lms.teacher@example.com" --password="123456"
ddev drush user:role:add lms_teacher "LMS Teacher"

# 3. Student roster (authenticated users; Group handles course access)
for NAME in "Molly Larkins" "John Smith" "Diego Ramos" "Emma Chen" "Nina Patel" "Sam Carter"; do
  MAIL=$(echo "$NAME" | tr '[:upper:] ' '[:lower:].')
  ddev drush user:create "$NAME" --mail="${MAIL}@example.com" --password="123456"
done
