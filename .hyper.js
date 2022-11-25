module.exports = {
  config: {
    updateChannel: 'stable',
    fontSize: 16,
    fontFamily: '"JetBrains Mono", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    fontWeight: 'normal',
    fontWeightBold: 'bold',
    lineHeight: 1,
    letterSpacing: 0,
    cursorShape: 'BLOCK',
    cursorBlink: false,
    padding: '12px 14px',
    shell: '/usr/bin/zsh',
    shellArgs: ['--login'],
    copyOnSelect: false,
    defaultSSHApp: true,
    quickEdit: false,
  },
  plugins: [
    "hyper-font-ligatures",
    "hypercwd",
    "hyper-true-fullscreen"
  ],
  localPlugins: [
    "dracula-pro"
  ],

  keymaps: {},
};
