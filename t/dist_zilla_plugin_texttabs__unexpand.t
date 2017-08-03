use Test2::V0 -no_srand => 1;
use Test::DZil;

my $tzil = Builder->from_config(
  { dist_root => 'corpus/DZT2' },
  {
    add_files => {
     'source/dist.ini' => simple_ini(
       {},
       # [GatherDir]
       'GatherDir',
       # [TextTabs]
       [ 'TextTabs', => { unexpand => 1 }, ],
     ),
    },
  },
);

$tzil->build;

my($file) = grep { $_->name =~ /DZT2\.pm/ } @{ $tzil->files };

like $file->content, qr{\t}, "tabs here!";
note $file->content;

done_testing;
