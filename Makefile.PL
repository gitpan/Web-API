
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Web::API - A Simple base module to implement almost every RESTful API with just a few lines of configuration",
  "AUTHOR" => "Tobias Kirschstein <lev\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Web-API",
  "EXE_FILES" => [],
  "LICENSE" => "bsd",
  "NAME" => "Web::API",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Data::Dump" => 0,
    "Data::Random" => 0,
    "HTTP::Cookies" => 0,
    "JSON" => 0,
    "LWP::UserAgent" => 0,
    "Mouse::Role" => 0,
    "Net::OAuth" => 0,
    "URI" => 0,
    "URI::Escape::XS" => 0,
    "URI::QueryParam" => 0,
    "XML::Simple" => 0
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "1.2",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



