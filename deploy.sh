hugo --minify
git commit -am "deploy"
git subtree push --prefix public origin gh-pages
git push origin main:main
