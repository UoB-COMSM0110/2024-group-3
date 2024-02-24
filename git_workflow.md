### Central Repository Branches

The central repository holds two main branches with an infinite lifetime:

- **main**: Represents the main branch where the source code always reflects a production-ready state.
- **develop**: Represents the branch where ongoing development work occurs.

### Feature Branches

Feature branches:

- **May branch off from**: `develop`
- **Must merge back into**: `develop`

#### Creating a Feature Branch

When starting work on a new feature, branch off from the `develop` branch:

```bash
$ git checkout -b myfeature develop
Switched to a new branch "myfeature"
$ git checkout develop
Switched to branch 'develop'
$ git merge --no-ff myfeature
Updating ea1b82a..05e9557
(Summary of changes)
$ git branch -d myfeature
Deleted branch myfeature (was 05e9557).
$ git push origin develop

