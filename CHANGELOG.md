# Changelog
All notable changes to this project will be documented in this file.

Please keep to the changelog format described on [keepachangelog.com](http://keepachangelog.com).

This project adheres to [Semantic Versioning](http://semver.org/).

## [1.2.1] - 2019-02-08
### Added
- Support for rails 6 beta

## [1.2.0] - 2018-10-21
### Fixed
- Replace dots for all types of values (not only Numeric)
### Removed
- Drop support for EOL rubies (2.2.10 and below)

## [1.1.1] - 2018-09-01
### Added
- Added a changelog.
- Also include HumanAttributeValues into ActiveModel::Model.
### Changed
- Instead of aborting and returning '' for associations of ActiveRecord::Base the lookup now proceeds with `assoc_attribute.to_s` as key (not meant to be done anyways).
### Removed
- Drop support for rails 4.1.8, including HumanAttributeValues into ActiveModel::Model does not add class method.
