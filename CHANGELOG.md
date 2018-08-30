# Changelog
All notable changes to this project will be documented in this file.

Please keep to the changelog format described on [keepachangelog.com](http://keepachangelog.com).

This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Added
- added a changelog
- also include HumanAttributeValues into ActiveModel::Model

### Changed
- instead of aborting and returning '' for associations of ActiveRecord::Base the lookup now proceeds with `assoc_attribute.to_s` as key (not meant to be done anyways)
