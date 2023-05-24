## Automagically Setting Up WordPress

Ready to unleash the powers of automation and effortlessly set up WordPress? Look no further, my friend! Follow these simple steps to make the magic happen.

Create a dazzling script called "setup.sh" and save it in your WordPress conf folder. If you already have a script, no worries! Just make the necessary adjustments and sprinkle in some fresh ingredients.

Let's make it flexible and customizable! We've passed most of the names as variables, so they can be easily fetched from your .env file. Talk about convenience! Remember to replace the username with your own (because, well, you're the star here).

Now, sit back, relax, and let the script do its thing. Watch as WordPress sets itself up automatically, just the way the guideline requires. It's like having your very own WordPress genie granting your wishes!

Oh, and don't forget to bask in the glory of your newly created WordPress kingdom. You've conquered automation, my friend!

With this setup script in place, you'll save precious time and effort. No more manual tinkering and configuration headaches. It's time to let the script take the stage and make WordPress setup a breeze.

Go ahead, embrace the beauty of automation, and let your WordPress dreams come true!


## setup.sh

    #!/bin/sh

    wp --allow-root --path=/var/www core install \
    --url="$DOMAIN_NAME" \
    --title="Chinedu's Word-Press" \
    --admin_user="$WPADUSER" \
    --admin_password="$WPADPASS" \
    --admin_email="cegbulef@student.42abudhabi.ae"

    wp user create "$WPUSER1" "user1@student.42abudhabi.ae" \
    --role=author \
    --user_pass="$WPUSER1PASS" \
    --allow-root

    wp --allow-root --path=/var/www option update blogname "Chinedu's Word-Press"
    wp --allow-root --path=/var/www option update blogdescription "The Inception of Things"
    wp --allow-root --path=/var/www option update blog_public 0

    # REDIS CACHE
    wp config set WP_CACHE true --allow-root
    wp config set WP_CACHE_KEY_SALT 'cegbulef.42.fr' --allow-root

    wp plugin install redis-cache --activate --allow-root
    wp redis enable --allow-root

    wp theme install twentytwentyone --activate --allow-root

    wp plugin update --all --allow-root

    /usr/sbin/php-fpm8 -F