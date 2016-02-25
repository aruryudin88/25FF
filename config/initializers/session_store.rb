# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :dalli_store,
                                       key: '_socifilm_session',
                                       namespace: 'sessions'
