# replaceToc.sh

__replaceToc.sh__ will replace ToC placeholders for retail, classic, tbc, wrath, cata, and mists.

Placeholders that will be replaced are:

    @toc-version-midnight@ -> "120000,120001"
    @toc-version-retail@ -> 110207
    @toc-version-mists@ -> 50503
    @toc-version-cata@ -> 40402
    @toc-version-wrath@ -> 30403
    @toc-version-bcc@ -> 20505
    @toc-version-classic@ -> 11508

Note: the retail placeholder will also include midnight, but only right before midnight goes live (to more easily define whether an addon is compatible with Midnight). The midnight placeholder will not be removed in the future, to aid backwards compatibility.

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
          mists: 1234
          cata: 1234
          wrath: 1234
          bcc: 1234
          classic: 1234
        with:
          args: file1.toc path/to/file2.toc

An example .toc file could be:

    ## Interface: @toc-version-retail@
    ## Interface-Retail: @toc-version-retail@
    ## Interface-Mists: @toc-version-mists@
    ## Interface-Cata: @toc-version-cata@
    ## Interface-Wrath: @toc-version-wrath@
    ## Interface-BCC: @toc-version-bcc@
    ## Interface-Classic: @toc-version-classic@
    ## Title: MyEpicAddon
    ## Notes: Making epic addons!
    ## Author: EpicAddonWriter2000
    ## Version: @project-version@

Or with a comma separated Interface version:

    ## Interface: @toc-version-retail@, @toc-version-mists@, @toc-version-cata@, @toc-version-wrath@, @toc-version-bcc@, @toc-version-classic@
    ## Title: MyEpicAddon
    ## Notes: Making epic addons!
    ## Author: EpicAddonWriter2000
    ## Version: @project-version@

