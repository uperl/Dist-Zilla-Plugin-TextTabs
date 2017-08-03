use Test2::V0 -no_srand => 1;
use Test::DZil;

my $tzil = Builder->from_config(
  { dist_root => 'corpus/DZT3' },
  {
    add_files => {
     'source/dist.ini' => simple_ini(
       {},
       # [GatherDir]
       'GatherDir',
       # [TextTabs]
       [ 'TextTabs', => { installer => 1 }, ],
     ),
    },
  },
);

$tzil->build;

my($file) = grep { $_->name =~ /Makefile\.PL/ } @{ $tzil->files };

unlike $file->content, qr{\t}, "no tabs here!";
note $file->content;

done_testing;
