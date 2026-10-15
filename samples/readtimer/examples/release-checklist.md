# Release checklist

Use this checklist before every release. It keeps the team consistent and
makes sure nothing is missed when several people share the work.

## Before you start

- Confirm that every change planned for this release is merged into the main branch.
- Check that the automated tests pass on the main branch.
- Ask the product owner to confirm the release date.

## Prepare the release

1. Update the version number in the project settings.
2. Write the release notes. For each change, say what is different for the
   user and whether they need to do anything.
3. Ask a developer and a tester to review the release notes for accuracy.
4. Tag the release in Git:

```bash
git tag -a v3.2.0 -m "Release 3.2.0"
git push origin v3.2.0
```

## After the release

- Publish the release notes where users will find them.
- Tell the support team what has changed, and share the list of known issues.
- Watch the support queue for the first two days, and record any new problems.

## If something goes wrong

Stop and tell the release manager straight away. Do not try to fix a failed
release on your own. The release manager will decide whether to roll back to the
previous version or to publish a fix.
