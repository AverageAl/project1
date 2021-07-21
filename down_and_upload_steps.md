Install Git, Visual Studio Code and maybe GitBash.
From some command line program go to folder you want to download a copy of the project into--or go to the folder like in Windows and right-click for "Gitbash Here."
On Github: go to the Main project page, green Code button, dropdown HTTPS: copy theLink there, then execute:
> git clone theLink   // To put a copy of the main project in your folder.
> git checkout -b nameOfNewBranch   // To create a "branch"--sort of a copy of the main project you just downloaded.
> git push --set-upstream origin naomeOfNewBranch   // To put the new branch up on Github--your new test branch.
