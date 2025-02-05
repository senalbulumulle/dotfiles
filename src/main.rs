/**
Senal's dotfiles manager
Written By Senal Bulumulle 
**/



// This is where we are able to Import Libraries


use std::process::{Command, exit};



// This is a function where you are able to symlink the vimrc file
fn symlink_vimrc()
{
    let _output = Command::new("ln -s /Users/$USER/dotfiles/.vimrc /Users/$USER/.vimrc").output();
}


// This is a function where you are able to symlink the zshrc file
fn symlink_zshrc()
{
    let _output = Command::new("ln -s /Users/$USER/dotfiles/.zshrc /Users/$USER/.zshrc").output();
}

fn main() {
    println!("hello world");
    symlink_vimrc();
    symlink_zshrc();
}
