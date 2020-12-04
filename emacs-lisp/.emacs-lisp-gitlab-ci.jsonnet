local exercism_projects = std.map(function(x) std.strReplace(x, '/', ''), std.split(std.extVar('exercism_projects'), '\n'));
local lang = std.extVar('lang');

local ElispTestJob(name) = {
  ['.' + lang + '-' + name + '-gitlab-ci.yml']: {
    default: {
      image: 'silex/emacs:ci',
    },
    ['test-' + lang + '-' + name + '-exercism']: {
      script: [
        'cd ' + name,
        'emacs -batch -l ert -l *-test.el -f ert-run-tests-batch-and-exit',
      ],
    },
  },
};


std.foldl(function(x, y) x + y, std.map(ElispTestJob, exercism_projects), {})
