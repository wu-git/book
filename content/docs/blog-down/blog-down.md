
---
title: "Using R Blogdown for Site Building"
author: "Ting Wu"
date: 2018-11-08
categories: ["R"]
tags: [ "R blogdown"]
weight: 1
---

### Using R Blogdown for Site Building

It's such a learning experience in setting up a website using github+ terminal + R blogdown + netlify for me.  In general, I followed the post from [Alison Hill] (https://alison.rbind.io/post/up-and-running-with-blogdown/). 

A couple of problems have occured and I have searched very hard to resolve them. 

* 1. R crash whenever I tried to open projects in Mac OS system. 

Solution: download update R version from (https://www.rstudio.com/products/rstudio/download/). Now I have Rstudio 1.1.463 - Mac OS X in my mac. 

* 2. I don't know how to push the local materials to github. 

Solution: It seems there are several ways to push local files to github. In R I follow the path ``Tools > Version Control > git``.  Then I select the folders that I would like to upload to github. However, some of the folders were NOT staged. In another word, I could not select these Not staged files in order to commit and push them to github.

To go around this, I used terminal. In terminal, I used `` cd `` to go to the local github clone file. Then I  used command `` git add -A `` .  All files in the folders were able to upload to github then. 

* 3. I could not publish my sites in netlify. 

After uploading all neccessary needed files into github, especially the 'public' folder, I followed the deploy setting but failed. The key step here turn out to be that you need to make sure that the hugo versions are consistent in your machine and netlify.  

In terminal, I typed in `` Hugo versoins` to obtain the hugo versions 0.51 in  my machine. In netlify, I added the variables in the deploy setting,  Hugo_version,  and set the value of 0.51.

* 4. Create a new post
option 1: use addins < NewPost>  which will create a newpost under the folder Content/Post
option 2: create a Post folder under Content/Post

* 5. Insert an image in RMD file and show it in blogdown

option 1: use addins <Insert image> during the edits of .md file 
This will generate a code in the file for example
```{r,   eval=FALSE}
![](/post/2019-03-27-median-survival-time_files/survivalpost1.png)  
```
The file directory is under static/ with the relative directory path

option 2: put the file in the corresponding post file under static/  , and enter the file relative file path. For example, here is another code to add in a image which will allow image size adjustment 


```{r, out.width = "400px", eval=FALSE}
knitr::include_graphics("/post/2019-03-27-median-survival-time_files/survivalpost2.png")
```


* 6. use git shell language to push changes 
Reference: [link]
(https://help.github.com/en/articles/adding-an-existing-project-to-github-using-the-command-line)

I did three lines of commands
git add . 
git commit -m "change"
git push -u origin master

* 7. I was trying to change my themes from academic to a more simple documentation theme. Instead of doing install_theme () which will create many errors during the installation. You may follow the direction https://geekdocs.de/usage/getting-started/ . step1: you may first create a new site in the git clone folder, using new_site () in R, which will use a default theme. step2: install the geekdoc theme in the site folder. You should see geekdoc folder appear in theme folder within the site folder.  step 3: you may just change the config.toml to the theme of geekdoc. Then run serve_site(). 