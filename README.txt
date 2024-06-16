JPF(1)

NAME
       jpf - job posting formatter

SYNOPSIS
       jpf company_name

DESCRIPTION
       Takes copied job listing and
       - Replaces starting, intermediate, and trailing whitespace.
       - Ensures 80 character line limit.
       - Redirects output to "company_name.txt".

P2M(1)

NAME
       p2m - post a text status to mastodon

SYNOPSIS
       p2m status

ENVIRONMENT VARIABLES
       MASTODON_SERVER_FQDN
       MASTODON_OAUTH_ACCESS_TOKEN
           Refer to https://$MASTODON_SERVER_FQDN/settings/applications
