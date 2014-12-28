package Complete::Dist::Zilla;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;
#use Log::Any '$log';

use Complete;

our %SPEC;
require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(
                       complete_dzil_plugin
                       complete_dzil_bundle
                       complete_dzil_role
               );

my %common_args = (
        word => {
            schema => 'str*',
            req => 1,
            pos => 0,
        },
        ci => {
            summary => 'Whether to do case-insensitive search',
            schema  => 'bool*',
        },
        map_case => {
            schema => 'bool',
        },
        exp_im_path => {
            schema => 'bool',
        },
);

$SPEC{complete_dzil_plugin} = {
    v => 1.1,
    summary => 'Complete with installed Dist::Zilla plugin names',
    args => {
        %common_args,
    },
    result_naked => 1,
};
sub complete_dzil_plugin {
    require Complete::Module;

    my %args = @_;

    my $word = $args{word} // '';
    my $ci          = $args{ci} // $Complete::OPT_CI;
    my $map_case    = $args{map_case} // $Complete::OPT_MAP_CASE;
    my $exp_im_path = $args{exp_im_path} // $Complete::OPT_EXP_IM_PATH;

    Complete::Module::complete_module(
        word => $word,
        ns_prefix => 'Dist::Zilla::Plugin',
        ci=>$ci, map_case=>$map_case, exp_im_path=>$exp_im_path,
    );
}

$SPEC{complete_dzil_role} = {
    v => 1.1,
    summary => 'Complete with installed Dist::Zilla role names',
    args => {
        %common_args,
    },
    result_naked => 1,
};
sub complete_dzil_role {
    require Complete::Module;

    my %args = @_;

    my $word = $args{word} // '';
    my $ci          = $args{ci} // $Complete::OPT_CI;
    my $map_case    = $args{map_case} // $Complete::OPT_MAP_CASE;
    my $exp_im_path = $args{exp_im_path} // $Complete::OPT_EXP_IM_PATH;

    Complete::Module::complete_module(
        word => $word,
        ns_prefix => 'Dist::Zilla::Role',
        ci=>$ci, map_case=>$map_case, exp_im_path=>$exp_im_path,
    );
}

$SPEC{complete_dzil_bundle} = {
    v => 1.1,
    summary => 'Complete with installed Dist::Zilla bundle names',
    args => {
        %common_args,
    },
    result_naked => 1,
};
sub complete_dzil_bundle {
    require Complete::Module;

    my %args = @_;

    my $word = $args{word} // '';
    my $ci          = $args{ci} // $Complete::OPT_CI;
    my $map_case    = $args{map_case} // $Complete::OPT_MAP_CASE;
    my $exp_im_path = $args{exp_im_path} // $Complete::OPT_EXP_IM_PATH;

    Complete::Module::complete_module(
        word => $word,
        ns_prefix => 'Dist::Zilla::PluginBundle',
        ci=>$ci, map_case=>$map_case, exp_im_path=>$exp_im_path,
    );
}

1;
#ABSTRACT:

=head1 SYNOPSIS
