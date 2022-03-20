#!/usr/bin/env python3
from __future__ import unicode_literals
import youtube_dl
import argparse
import re
import os


class MyLogger(object):

    def debug(self, msg):
        pass

    def warning(self, msg):
        pass

    def error(self, msg):
        print(msg)


class Downloader():
    parser = argparse.ArgumentParser("simple_example")
    parser.add_argument('url',
                        help="The download Youtube url to download",
                        type=str)

    parser.add_argument("--debug",
                        dest='debug',
                        default=False,
                        help="Print Debug Information",
                        type=bool)

    parser.add_argument("--type",
                        dest='type',
                        default='audio',
                        help="Output format audio/video",
                        type=str)

    args = parser.parse_args()
    # args.debug = True

    dir_path = os.path.dirname(os.path.realpath(__file__))
    home_folder = os.path.expanduser('~')
    out_dir = home_folder + '/Musik/%(title)s-%(id)s.%(ext)s'
    if args.type == 'video':
        out_dir = home_folder + '/Videos/%(title)s-%(id)s.%(ext)s'

    def my_hook(d):
        if d['status'] == 'finished':
            print('Done downloading, now converting ...')

    opts = {
        'outtmpl':
        out_dir,
        'format':
        'bestaudio/best',
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'mp3',
            'preferredquality': '192',
        }],
        'logger':
        MyLogger(),
        'progress_hooks': [my_hook],
    }

    if args.type == 'video':
        opts = {
            'outtmpl': out_dir,
            'format': 'bestvideo/best',
            'recode-video': 'mp4',
            'logger': MyLogger(),
        }

    def debugInfo(args, home_folder, dir_path, out_dir, opts):
        print(args.url)
        print(args.type)
        args.url = 'https://www.youtube.com/watch?v=BaW_jenozKc'
        print(args.url)
        print(home_folder)
        print(dir_path)
        print(out_dir)
        print(opts)

    if args.debug:
        debugInfo(args, home_folder, dir_path, out_dir, opts)

    pattern = r'^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?$'
    regex = re.compile(pattern)
    if not regex.match(args.url):
        print('The url is no valid youtube url')
        exit()

    with youtube_dl.YoutubeDL(opts) as ydl:
        ydl.download([args.url])


if __name__ == "__main__":
    Downloader()
