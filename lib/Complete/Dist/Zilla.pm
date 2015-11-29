package Complete::Dist::Zilla;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;
#use Log::Any '$log';

use Complete::Common qw(:all);

our %SPEC;
require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(
                       complete_dzil_plugin
                       complete_dzil_bundle
                       complete_dzil_role
               );

$SPEC{complete_dzil_plugin} = {
    v => 1.1,
    summary => 'Complete with installed Dist::Zilla plugin names',
    args => {
        %arg_word,
    },
    result_naked => 1,
};
sub complete_dzil_plugin {
    require Complete::Module;

    my %args = @_;

    my $word = $args{word} // '';

    Complete::Module::complete_module(
        word => $word,
        ns_prefix => 'Dist::Zilla::Plugin',
    );
}

$SPEC{complete_dzil_role} = {
    v => 1.1,
    summary => 'Complete with installed Dist::Zilla role names',
    args => {
        %arg_word,
    },
    result_naked => 1,
};
sub complete_dzil_role {
    require Complete::Module;

    my %args = @_;

    my $word = $args{word} // '';

    Complete::Module::complete_module(
        word => $word,
        ns_prefix => 'Dist::Zilla::Role',
    );
}

$SPEC{complete_dzil_bundle} = {
    v => 1.1,
    summary => 'Complete with installed Dist::Zilla bundle names',
    args => {
        %arg_word,
    },
    result_naked => 1,
};
sub complete_dzil_bundle {
    require Complete::Module;

    my %args = @_;

    my $word = $args{word} // '';

    Complete::Module::complete_module(
        word => $word,
        ns_prefix => 'Dist::Zilla::PluginBundle',
    );
}

1;
#ABSTRACT:

=head1 SYNOPSIS
