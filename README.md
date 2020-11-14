
# checkdata

<!-- badges: start -->
<!-- badges: end -->

The goal of checkdata is to check whether the data is normal or not.

## Package set up 
1. Create a new project in Rstudio and specify the project type as a package in the local Rstudio environment.  

2. Generate a README file by the `use_readme_md()` from the **usethis** package.  

3. Generate a LICENSE file by the `use_mit_license("Shuyi Tan")` from the **usethis** package.  

4. Wrap my **normarlity_test()** function into a R script named **normality.R** and save it in the R folder.  

5. Generate a test folder by the function `use_test("my-test")` from the **usethis** package.  

6. Make a vignette by `usethis::use_vignette("Vignette")`

7. Document the files by `devtools::document()`

6. Create a remote repository in github.com and named as "checkdata"  

7. Run the following command to push the local package framework to the "checkdata" repo  
    - Initialize the local project as a Git repository: `git init_`  
    - Add the files to my new local repository: `git add .`
    - Commit the files: `git commit -m "initial commit"`
    - Push the local repo to the remote repo: `git remote add origin https://github.com/yelselmiao/checkdata` and `git remote -v` 
    - Push the changes to the remote repo: `git push -f origin master`
  
