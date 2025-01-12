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

YI2(1)

NAME
       yi2 - yank lines from a file into another

SYNOPSIS
       yi2 src start end dst offset

DESCRIPTION
       Copies lines from start to end of src into dst at line offset.

SPECIAL
       Line offsets count from 1 so as a convenience for when copying a single
       line, end can be 0 to signify end is equal to start.

       For example,

         yi2 a 73392 0 b 42

       copies line 73392 from a into b at line offset 42.
