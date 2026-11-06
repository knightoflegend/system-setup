# paru completions for fish shell

# Main operations
complete -c paru -f -a \
  "-S -Sy -Syu -Ss -Si -Sl -Sp -Sq -Sw -Su -Sc -Scc -Syy -Syyy \
   -R -Rs -Rns -Rn -Rsn -Rc -Rdd -Rdd \
   -Q -Qi -Ql -Qm -Qn -Qo -Qp -Qq -Qs -Qt -Qu -Qe -Qd -Qg -Qk -Qc -Qii \
   -U --upgrade --needed --noconfirm --confirm --ask --noask \
   -G --getpkgbuild --getpkgbuild-all \
   -c --clean --clean-cache --clean-all \
   -h --help --version --verbose --quiet --color --nocolor \
   --skipinteg --skippgpcheck --skipchecksums \
   --noedit --force --overwrite --overwriteglob \
   --ignore --ignoregroup --assume-installed \
   --config --repo --database --root --cachedir --logfile \
   --gpgdir --hookdir --arch --temp --builddir \
   --pkgver --pkgrel --epoch --arch --buildenv --checkenv \
   --sign --sign-key --verify --key --keyserver --keyserver-options \
   --pgp-check --no-pgp-check --gpglist --gpgcheck \
   --download-only --print-format --print --print-srcinfo \
   --rebuild --rebuild-tree --rebuild-all --rebuild-deps \
   --devel --skip-devel --hold --holdpkg --holdver \
   --provides --conflicts --replaces --depends --optdepends --makedepends --checkdepends \
   --groups --license --url --backup --options --changelog \
   --install --remove --upgrade --downgrade --sync --refresh --sysupgrade \
   --aur --no-aur --aur-only --devel-only --git --hg --svn --bzr \
   --clone-dir --build-dir --src-dir --pkg-dir --log-dir \
   --makepkg-args --makepkg-conf --pacman-conf --pacman-bin \
   --sudo --sudo-loop --no-sudo --su --su-loop --no-su \
   --batch --interactive --no-interactive --confirm-all --no-confirm-all"

# Package name completions for -S, -R, -Q operations
complete -c paru -n "__fish_seen_subcommand_from -S" -f -a "(paru -Slq 2>/dev/null)"
complete -c paru -n "__fish_seen_subcommand_from -R" -f -a "(paru -Qq 2>/dev/null)"
complete -c paru -n "__fish_seen_subcommand_from -Q" -f -a "(paru -Qq 2>/dev/null)"
complete -c paru -n "__fish_seen_subcommand_from -G" -f -a "(paru -Slq 2>/dev/null)"

# AUR package completions
complete -c paru -n "__fish_seen_subcommand_from -Ss" -f -a "(paru -Slq 2>/dev/null)"
complete -c paru -n "__fish_seen_subcommand_from -Si" -f -a "(paru -Slq 2>/dev/null)"

# Common flag combinations
complete -c paru -s S -l sync -d "Sync packages"
complete -c paru -s R -l remove -d "Remove packages"
complete -c paru -s Q -l query -d "Query packages"
complete -c paru -s G -l getpkgbuild -d "Get PKGBUILD"
complete -c paru -s U -l upgrade -d "Upgrade package file"
complete -c paru -s c -l clean -d "Clean cache"
complete -c paru -s h -l help -d "Show help"
complete -c paru -s v -l version -d "Show version"
complete -c paru -s V -l verbose -d "Verbose output"
complete -c paru -s q -l quiet -d "Quiet output"
complete -c paru -s y -l refresh -d "Refresh databases"
complete -c paru -s u -l sysupgrade -d "System upgrade"
complete -c paru -s n -l needed -d "Only install needed"
complete -c paru -s s -l search -d "Search packages"
complete -c paru -s i -l info -d "Show package info"
complete -c paru -s l -l list -d "List packages"
complete -c paru -s p -l package -d "Query package file"
complete -c paru -s o -l owns -d "Query file owner"
complete -c paru -s k -l check -d "Check package files"
complete -c paru -s g -l groups -d "View groups"
complete -c paru -s d -l deps -d "Install as dependency"
complete -c paru -s e -l explicit -d "Install as explicit"
complete -c paru -s t -l unrequired -d "Show unrequired"
complete -c paru -s C -l clean-all -d "Clean all cache"
complete -c paru -s w -l download -d "Download only"