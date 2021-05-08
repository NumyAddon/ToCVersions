# replaceToc.sh

__replaceToc.sh__ will replace ToC placeholders for retail, classic and tbc.

Placeholders that will be replaced are:
    
    @toc-version-retail@
    @toc-version-bc@
    @toc-version-classic@

The best way to use this, is as part of your addon builds, between checkout and using a packager (e.g. bigwigs packager)

Example usage:

    steps:
      - uses: actions/checkout@v2

      - name: Replace toc-versions
        uses: Numynum/ToCVersions@master

      - name: Create Retail Package
        uses: BigWigsMods/packager@master

By default, it will replace placeholders in all .toc files in your root directory.
If this isn't enough, you can instead pass a list of files to replace:

      - name: Replace toc-versions
        uses: Numynum/ToCVersions@master
        with:
          args: file1.toc path/to/file2.toc

If needed for some reason, you can override the versions, by passing them as environment variables.
Full example:

      - name: Replace toc-versions
        uses: Numynum/ToCVersions@master
        env:
          retail: 1234
          bc: 1234
          classic: 1234
        with:
          args: file1.toc path/to/file2.toc

An example .toc file could be:

    ## Interface: @toc-version-retail@
    ## Interface-Retail: @toc-version-retail@
    ## Interface-Classic: @toc-version-classic@
    ## Interface-BC: @toc-version-bc@
    ## Title: MyEpicAddon
    ## Notes: Making addons great again!
    ## Author: EpicAddonWriter2000
    ## Version: @project-version@
