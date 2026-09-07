export default {
  async fetch(request, env) {
    const url = new URL(request.url);

    // 1. Canonical Domain & Protocol Enforcement (301 Permanent)
    const isWww = url.hostname.toLowerCase().startsWith('www.');
    const isHttp = url.protocol === 'http:' || request.headers.get('x-forwarded-proto') === 'http';

    if (isWww || isHttp) {
      url.hostname = url.hostname.replace(/^www\./i, '');
      url.protocol = 'https:';
      return Response.redirect(url.toString(), 301);
    }

    // 2. Delegate to Cloudflare Static Assets
    return env.ASSETS.fetch(request);
  }
};
