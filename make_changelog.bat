git log --pretty="- %%s" > CHANGELOG.md

git add CHANGELOG.md

git commit -m "feat(main): add changelog"

git config http.postBuffer 524288000

git push

pause