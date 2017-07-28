# Command line instructions
- Git global setup
```
git config --global user.name "dev name"
git config --global user.email "msncdma@gtest.com"
```
- Create a new repository
```
git clone git@gitlab.rd.91160.com:xlog/Ocealth.git
cd Ocealth
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master
```
- Existing folder or Git repository
```
cd existing_folder
git init
git remote add origin git@gitlab.rd.test.com:xlog/Ocealth.git
git add .
git commit
git push -u origin master
```
