name: Create New Release

on:
  workflow_dispatch:

jobs:
  build:
    runs-on: macos-15
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Install dependencies (packages)
        run: |
          curl -LO https://github.com/ProcursusTeam/ldid/releases/download/v2.1.5-procursus7/ldid_macosx_x86_64
          sudo install -m755 ldid_macosx_x86_64 /usr/local/bin/ldid
          brew install 7zip gnu-sed

      - name: Compile f
        run: | 
          mkdir upload
          make package SCHEME="'backdoor (Release)'" CFLAGS="-Onone"
          mv packages/* upload/

      - name: Get Version Number
        id: get_version
        run: |
          VERSION=$( /usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" Payload/backdoor.app/Info.plist )
          echo "VERSION=${VERSION}" >> $GITHUB_ENV

      - name: Setup
        run: |
          mv upload/backdoor.ipa upload/backdoor_v${VERSION}.ipa
          cp upload/backdoor_v${VERSION}.ipa upload/backdoor_v${VERSION}.tipa

      - name: Create GitHub Release
        uses: softprops/action-gh-release@v2
        with:
          name: backdoor v${{ env.VERSION }}
          tag_name: v${{ env.VERSION }}
          files: |
            upload/*ipa
          generate_release_notes: true
          fail_on_unmatched_files: true
        env:
          GITHUB_TOKEN: ${{ env.GITHUB_TOKEN }}