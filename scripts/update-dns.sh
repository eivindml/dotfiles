#!/bin/bash

vercel dns add madebymist.com home A $(curl -s ifconfig.me)
