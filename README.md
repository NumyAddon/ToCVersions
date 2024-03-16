# replaceToc.sh

__replaceToc.sh__ will replace ToC placeholders for retail, classic, tbc, wrath, and cata.

Placeholders that will be replaced are:
    
    @toc-version-retail@
    @toc-version-cata@
    @toc-version-wrath@
    @toc-version-bcc@
    @toc-version-classic@

The best way to use this, is as part of your addon builds, between checkout and using a packager (e.g. bigwigs packager)

Example usage:

    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Replace toc-versions
        uses: NumyAddon/ToCVersions@v1

      - name: Create Retail Package
        uses: BigWigsMods/packager@v2

By default, it will replace placeholders in all .toc files in your repository.
If this isn't what you want, you can instead pass a list of files to replace:

      - name: Replace toc-versions
        uses: NumyAddon/ToCVersions@v1
        with:
          args: file1.toc path/to/file2.toc

If needed for some reason, you can override the versions, by passing them as environment variables.
Full example:

      - name: Replace toc-versions
        uses: NumyAddon/ToCVersions@v1
        env:
          retail: 1234
          cata: 1234
          wrath: 1234
          bcc: 1234
          classic: 1234
        with:
          args: file1.toc path/to/file2.toc

An example .toc file could be:

    ## Interface: @toc-version-retail@
    ## Interface-Retail: @toc-version-retail@
    ## Interface-Cata: @toc-version-cata@
    ## Interface-Wrath: @toc-version-wrath@
    ## Interface-BCC: @toc-version-bcc@
    ## Interface-Classic: @toc-version-classic@
    ## Title: MyEpicAddon
    ## Notes: Making epic addons!
    ## Author: EpicAddonWriter2000
    ## Version: @project-version@
