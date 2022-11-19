now=$(date "+%Y-%m-%d")
echo "Starting add-commit-pull-push..."
git add . && git commit -m "$now" && git push git@github.com:CoordinatesNotFound/csapp.git
echo "Finish!"
read
