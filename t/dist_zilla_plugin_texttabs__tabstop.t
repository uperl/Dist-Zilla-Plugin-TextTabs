use Test2::V0 -no_srand => 1;
use Test::DZil;

plan tests => 1;

my $tzil = Builder->from_config(
  { dist_root => 'corpus/DZT1' },
  {
    add_files => {
     'source/dist.ini' => simple_ini(
       {},
       # [GatherDir]
       'GatherDir',
       # [TextTabs]
       [ 'TextTabs', => { tabstop => 4 }, ],
     ),
    },
  },
);

$tzil->build;

my($file) = grep { $_->name =~ /DZT1\.pm/ } @{ $tzil->files };

like $file->content, qr{^    print}m, "no tabs here!";
note $file->content;

done_testing;
