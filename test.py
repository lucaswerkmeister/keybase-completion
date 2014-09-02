#!/usr/bin/python
# Bash completion test library from https://github.com/lacostej/unity3d-bash-completion

import unittest
import os
from lib.completion import BashCompletionTest

class KeybaseTestCase(BashCompletionTest):

    def test_subcommand(self):
        self.run_complete("", "btc bitcoin cert dir code-sign config decrypt dec encrypt enc help id identify join signup keygen gen generate list-signatures list-sigs list-tracking login logout pull push prove proof reset nuke revoke revoke-signatures revoke-sig search sign sig status switch track untrack unverify update verify version vers")

    def test_subcommand_reduced(self):
        self.run_complete("list", "list-signatures list-sigs list-tracking")

    def test_subcommand_single(self):
        self.run_complete("ide", "identify")

    def test_id(self):
        os.environ['HOME'] = 'test'
        self.run_complete("id ", "chris max salandas")

    def test_id_single(self):
        os.environ['HOME'] = 'test'
        self.run_complete("id s", "salandas")

    def test_id_param(self):
        self.run_complete("id -", "-a --assert")

    def test_proof(self):
        self.run_complete("proof ", "twitter github web dns rediit coinbase hackernews")

    def test_proof_dir(self):
        self.run_complete("proof -o k", "keybase.sh")

    def test_proof_param(self):
        self.run_complete("proof -", "-f --force -o --output")

    def test_proof_single(self):
        self.run_complete("proof twitter ", "")

    def test_assertion(self):
        self.run_complete("id --assert ", "github: coinbase: twitter: web: key: keybase: reddit: hackernews: dns:")

    def test_assertion_single(self):
        self.run_complete("id --assert gi", "github:")

    def test_config_part(self):
        self.run_complete("config files.", "files.db files.nedb files.session files.tmp_keyring_dir")

    def test_config_value(self):
        self.run_complete("config no_color ", "true false")

    def test_preset_all(self):
        self.run_complete("dir sign --presets ", "git kb dropbox none")

    def test_preset_single(self):
        self.run_complete("dir sign --presets gi", "git")

    def test_preset_2nd_all(self):
        self.run_complete("dir sign --presets git,", "git,git git,kb git,dropbox")

    def test_preset_2nd_single(self):
        self.run_complete("dir sign --presets git,dr", "git,dropbox")

    def run_complete(self, command, expected):
        completion_file="keybase.sh"
        program="keybase"
        super(KeybaseTestCase, self).run_complete(completion_file, program, command, expected)

if (__name__=='__main__'):
    unittest.main()
