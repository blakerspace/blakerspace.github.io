# run in root folder on main branch
hugo --minify
git add .
git commit -am "deploy"
git push origin `git subtree split --prefix public main`:gh-pages --force-with-lease
git push origin main:main
