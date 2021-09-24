import React from "react";

import {
  FaFacebookF,
  FaTwitter,
  FaGoogle,
  FaInstagram,
  FaLinkedinIn,
  FaGithub,
} from "react-icons/fa";

export const Footer = () => {
  const year = new Date().getFullYear();
  return (
    <footer className="fixed-bottom bg-dark text-center text-white">
      <div className="container p-2">
        <section>
          <a
            className="btn btn-outline-light btn-floating m-1"
            href="#!"
            role="button"
          >
            <FaFacebookF />
          </a>

          <a
            className="btn btn-outline-light btn-floating m-1"
            href="#!"
            role="button"
          >
            <FaTwitter />
          </a>

          <a
            className="btn btn-outline-light btn-floating m-1"
            href="#!"
            role="button"
          >
            <FaGoogle />
          </a>

          <a
            className="btn btn-outline-light btn-floating m-1"
            href="#!"
            role="button"
          >
            <FaInstagram />
          </a>

          <a
            className="btn btn-outline-light btn-floating m-1"
            href="#!"
            role="button"
          >
            <FaLinkedinIn />
          </a>

          <a
            className="btn btn-outline-light btn-floating m-1"
            href="#!"
            role="button"
          >
            <FaGithub />
          </a>
        </section>
      </div>

      <div className="text-center p-2">
        © {year} Copyright: &nbsp;
        <a
          className="text-white"
          href="https://github.com/prastasubagia/kargo-one"
        >
          Team #1
        </a>
      </div>
    </footer>
  );
};
