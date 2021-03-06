#!/bin/zsh

# export BLOG="/path/to/your/octopress/install"

# handles globbing weirdness with zsh + use it from anywhere
# use: new-post "This is my exciting new post!!!"
# set the blog variable to your octopress directory
# TODO: fix this so it handles double-titling

function new-post () {
    echo "Creating a new_post titled '$1'."
    cd $BLOG/
    newpost=$(bundle exec rake "new_post[$1]" | awk '{print $4}')
    $EDITOR $BLOG/$newpost
}

# go to given octopress folder and preview the blog + open chrome to view
function octopress-preview () {
    currdir=$PWD
    cd $1
    bundle exec rake preview &
    google-chrome "http://localhost:4000" &
    cd $currdir
}

alias blog-preview="octopress-preview $BLOG"
