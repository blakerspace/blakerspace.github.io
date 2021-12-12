# run in root folder on main branch
hugo --minify
git add .
git commit -am "deploy"
git push origin main:main
firebase deploy
