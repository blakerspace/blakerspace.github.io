hugo --minify
git commit -am "deploy"
git subtree push --prefix dist origin gh-pages
git push origin main:main
