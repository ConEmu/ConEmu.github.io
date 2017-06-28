# GitHub-pages and Jekyll local installation

## Install jekyll

1. Install [Ruby 2.1.0 or higher](https://rubyinstaller.org/).
2. Reboot console if required, the command `ruby --version` must shows something like `ruby 2.X.X`.
3. Install bundler: `gem install bundler`.
4. Install jekyll and deps: `bundle install`.

## Update jekyll

```
bundle update
```

## Build site locally

```
jekyll build -s ./ -d ./web/
```
